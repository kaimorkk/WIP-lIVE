TableExtension 52193662 tableextension52193662 extends "Profile Questionnaire Line" 
{

    //Unsupported feature: Code Modification on "FinishWizard(PROCEDURE 7)".

    //procedure FinishWizard();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ProfileQuestionnaireLine.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
        IF ProfileQuestionnaireLine.FINDLAST THEN
          QuestionLineNo := ProfileQuestionnaireLine."Line No." + 10000
        #4..8
        ProfileQuestionnaireLine.INSERT(TRUE);

        NextLineNo := QuestionLineNo;
        TempProfileQuestionnaireLine.RESET;
        IF TempProfileQuestionnaireLine.FINDSET THEN
          REPEAT
            NextLineNo := NextLineNo + 10000;
            ProfileQuestionnaireLine := TempProfileQuestionnaireLine;
        #17..22

        ProfileQuestionnaireLine.GET("Profile Questionnaire Code",QuestionLineNo);
        ProfileMgt.ShowAnswerPoints(ProfileQuestionnaireLine);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        // RENAME(ProfileQuestionnaireCode);

        #1..11
        IF TempProfileQuestionnaireLine.FIND('-') THEN
        #14..25
        */
    //end;
}

