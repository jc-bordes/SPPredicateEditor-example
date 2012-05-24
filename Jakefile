/*
 * Jakefile
 * SPPredicateEditor
 *
 * Created by You on May 5, 2012.
 * Copyright 2012, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("SPPredicateEditor", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "SPPredicateEditor.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("SPPredicateEditor");
    task.setIdentifier("com.yourcompany.SPPredicateEditor");
    task.setVersion("1.0");
    task.setAuthor("Your Company");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("SPPredicateEditor");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["SPPredicateEditor"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "SPPredicateEditor", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "SPPredicateEditor", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "SPPredicateEditor"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "SPPredicateEditor"), FILE.join("Build", "Deployment", "SPPredicateEditor")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "SPPredicateEditor"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "SPPredicateEditor"), FILE.join("Build", "Desktop", "SPPredicateEditor", "SPPredicateEditor.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "SPPredicateEditor", "SPPredicateEditor.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

task("test", function()
{
    var tests = new FileList('Tests/*Test.j');
    var cmd = ["ojtest"].concat(tests.items());
    var cmdString = cmd.map(OS.enquote).join(" ");

    var code = OS.system(cmdString);
    if (code !== 0)
        OS.exit(code);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "SPPredicateEditor"));
    print("----------------------------");
}

