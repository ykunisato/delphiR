#' @title Set template files for delphi questionnaire
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @param inst instruction
#' @param question question
#' @param max_response maximum number of response
#' @param min_response minimum number of response
#' @param dir_name name of directory
#' @param jsPsych_version If you set a specific version number of jsPsych,
#'                set_jsPsych prepare a file with that version of jsPsych.
#' @examples # set_round1()
#' @export
set_round1 <- function(inst,
                       question,
                       max_response = 10,
                       min_response = 5,
                       dir_name = "round1",
                       jsPsych_version = "7.2.1"){
  # check jsPsych version
  if(jsPsych_version=="7.1.1"||jsPsych_version=="7.1.2"||jsPsych_version=="7.2.1"){
  }else{
    stop(paste0("jsPsych ",jsPsych_version," is not available!"))
  }
  # set directory
  path = getwd()
  dir.create(file.path(path, dir_name), showWarnings = FALSE)
  path = paste0(path,"/",dir_name)
  # prepare the files and directories
  if(substr(jsPsych_version, 1, 1)=="7"){
    ## make demo-.html file
    tmp_html <- file(file.path(path, paste0("demo_",dir_name,".html")), "w")
    writeLines("<!DOCTYPE html>", tmp_html)
    writeLines("<html>", tmp_html)
    writeLines(" <head>", tmp_html)
    writeLines('  <meta charset="UTF-8" />', tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/jspsych.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-fullscreen.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-html-keyboard-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-html-button-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-html-form.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-matrix-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-multi-choice.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-multi-select.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-text.js"></script>'), tmp_html)
    writeLines(paste0('  <link href="',dir_name,'/jspsych/dist/jspsych.css" rel="stylesheet" type="text/css" />'), tmp_html)
    writeLines(" </head>", tmp_html)
    writeLines(" <body></body>", tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',dir_name,'/demo_jspsych_init.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',dir_name,'/task.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',dir_name,'/demo_jspsych_run.js"></script>'), tmp_html)
    writeLines("</html>", tmp_html)
    close(tmp_html)
    ## make -.html file
    tmp_html <- file(file.path(path, paste0(dir_name,".html")), "w")
    writeLines("<!DOCTYPE html>", tmp_html)
    writeLines("<html>", tmp_html)
    writeLines(" <head>", tmp_html)
    writeLines('  <meta charset="UTF-8" />', tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/jspsych.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-fullscreen.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-html-keyboard-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-html-button-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-matrix-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-multi-choice.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-multi-select.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',dir_name,'/jspsych/dist/plugin-survey-text.js"></script>'), tmp_html)
    writeLines('  <script src="jatos.js"></script>', tmp_html)
    writeLines(paste0('  <link href="',dir_name,'/jspsych/dist/jspsych.css" rel="stylesheet" type="text/css" />'), tmp_html)
    writeLines(" </head>", tmp_html)
    writeLines(" <body></body>", tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',dir_name,'/jatos_jspsych_init.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',dir_name,'/task.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',dir_name,'/jatos_jspsych_run.js"></script>'), tmp_html)
    writeLines("</html>", tmp_html)
    close(tmp_html)
    ## make directory of repository
    dir.create(file.path(path, dir_name), showWarnings = FALSE)
    ## download jsPsych
    temp_jsPsych <- tempfile()
    if(jsPsych_version=="7.0.0"){
      download.file(paste0('https://github.com/jspsych/jsPsych/releases/download/jspsych@7.0.0/jspsych-7.0.0-dist.zip'),temp_jsPsych)
    }else{
      download.file(paste0('https://github.com/jspsych/jsPsych/releases/download/jspsych@',jsPsych_version,'/jspsych.zip'),temp_jsPsych)
    }
    unzip(temp_jsPsych, exdir = file.path(path, dir_name,"jspsych"))
    unlink(temp_jsPsych)
    ## download js files
    file_path <- paste0(path,"/",dir_name)
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/demo_jspsych_init.js"),paste0(file_path,"/demo_jspsych_init.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/demo_jspsych_run.js"),paste0(file_path,"/demo_jspsych_run.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/jatos_jspsych_init.js"),paste0(file_path,"/jatos_jspsych_init.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/jatos_jspsych_run.js"),paste0(file_path,"/jatos_jspsych_run.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/jspsych/plugin-survey-matrix-likert.js"),paste0(file_path,"/jspsych/dist/plugin-survey-matrix-likert.js"))
    ## make task.js file
    tmp_taskJs <- file(file.path(file_path, paste0("task.js")), "w")
    writeLines("var question = {", tmp_taskJs)
    writeLines(" type: jsPsychSurveyText,", tmp_taskJs)
    instruction <- paste0(" preamble:'", inst,"',")
    writeLines(instruction, tmp_taskJs, useBytes=T)
    writeLines("questions: [", tmp_taskJs)
    question1 <- paste0("  {prompt:'", question,"', rows: 4, required: true},")
    for (i in 1:min_response) {
      writeLines(question1, tmp_taskJs, useBytes=T)
    }
    question2 <- paste0("  {prompt:'", question,"', rows: 4},")
    for (i in 1:(max_response-min_response)) {
      writeLines(question2, tmp_taskJs, useBytes=T)
    }
    writeLines("]}", tmp_taskJs)
    writeLines("const timeline = [question];", tmp_taskJs)
    close(tmp_taskJs)
    ## make stimli directory and picture
    dir.create(file.path(file_path, "stimuli"), showWarnings = FALSE)
    stim_path <- paste0(file_path,"/stimuli")
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/reward.jpeg"),paste0(stim_path,"/reward.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/punishment.jpeg"),paste0(stim_path,"/punishment.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s1.jpeg"),paste0(stim_path,"/s1.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s1s.jpeg"),paste0(stim_path,"/s1s.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s2.jpeg"),paste0(stim_path,"/s2.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s2s.jpeg"),paste0(stim_path,"/s2s.jpeg"))
  }
}
