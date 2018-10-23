#!/usr/bin/env kscript

//DEPS ch.qos.logback:logback-classic:1.2.2
//DEPS org.slf4j:slf4j-api:1.7.25
//DEPS commons-io:commons-io:2.5
//DEPS at.mikemitterer:builddart:0.0.1

@file:Suppress("PropertyName")

import at.mikemitterer.dbuilder.cpyFile
import at.mikemitterer.dbuilder.logLevel
import at.mikemitterer.dbuilder.properties
import at.mikemitterer.dbuilder.splitMarkdown
import at.mikemitterer.dbuilder.mergeHtmlTemplate
import org.apache.commons.io.FilenameUtils
import org.slf4j.LoggerFactory
import java.io.File

val SCRIPT = "${System.getProperty("user.dir")}/.prep.kts"
val SCRIPTPATH = FilenameUtils.getFullPathNoEndSeparator(SCRIPT)!!
val SAMPLE_NAME = FilenameUtils.getBaseName(SCRIPTPATH)!!

private val logger = LoggerFactory.getLogger("$SAMPLE_NAME.prep.kts").apply {
    (this as ch.qos.logback.classic.Logger).level = logLevel
}

logger.debug("Script: $SCRIPT")
logger.debug("Script-Path: $SCRIPTPATH")
logger.debug("Sample: $SAMPLE_NAME")

// If pubspec.template is set, it generates a pubspec.yaml
// for this example based on the given template
properties["pubspec.template"]?.apply {

    val filename = this.toString()

    cpyFile(File(filename),
            File(SCRIPTPATH, "pubspec.yaml"),
            mapOf("samplename" to SAMPLE_NAME))

    logger.info("pubspec.yaml updated for $SAMPLE_NAME! ")

} ?: run {
    logger.debug("$SAMPLE_NAME has it's own pubspec.yaml! ")
}

// If sample.html.template and sample.content are given
// the index.html for this example will be generated based on these two files.
//
// sample.content is a MarkDown-File with a file-header separated by "~~~"
properties["sample.html.template"]?.apply {

    val htmlTemplate = File(this.toString()).readText()

    properties["sample.content"]?.apply {

        val contentFile = File(this.toString())
        var indexHtml = File("web","index.html")

        val content = splitMarkdown(contentFile.readText()) {
            kvPairs, mdBlock ->
            mergeHtmlTemplate(htmlTemplate, kvPairs, mdBlock)
        }

        indexHtml.writeText(content)
        logger.info("index.html updated for $SAMPLE_NAME! ")

    } ?: {
        logger.debug("$SAMPLE_NAME has no _content/index.html! ")
    }
} ?: run {
    logger.debug("$SAMPLE_NAME has no default.index.html! ")
}

properties["sample.appstyle"]?.apply {

    // default.app.scss
    val filename = this.toString()

    cpyFile(File(filename),
            File(File(SCRIPTPATH,"web"), "_app.scss"), emptyMap<String,String>())

    logger.info("_app.scss updated for $SAMPLE_NAME! ")

} ?: run {
    logger.debug("$SAMPLE_NAME has it's own _app.scss! ")
}