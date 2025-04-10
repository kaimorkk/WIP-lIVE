Page 52194345 "Technical Competences-IBP"
{
    AutoSplitKey = false;
    PageType = ListPart;
    SourceTable = "Appraisal Lines1";
    SourceTableView = sorting("No.")
                      where("Appraisal Heading Type"=const("Technical Competencies"),
                            "Strategic Perspective"=const("Internal Business Process"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                    Editable = false;
                }
                field(Measure;Measure)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReviewCommentsAchievements;"Review Comments/ Achievements")
                {
                    ApplicationArea = Basic;
                }
                field(Weighting;"Weighting(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PerformanceRatings;"Performance Ratings(%)")
                {
                    ApplicationArea = Basic;
                }
                field(WeightedRatings;"Weighted Ratings(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraisersComments;"Appraiser's Comments")
                {
                    ApplicationArea = Basic;
                }
                field(Appraiseescomments;"Appraisee's comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(PerformanceMeasures)
            {
                Caption = 'Performance Measures';
                action(ObjectivePerformanceMeasures)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective Performance Measures';
                    RunObject = Page "Objective Performance Measures";
                    RunPageLink = ObjectiveID=field("Line No"),
                                  "Appraisal No"=field("Appraisal No");

                    trigger OnAction()
                    begin

                        MeasureFormats.Reset;
                        if MeasureFormats.Find('-') then
                         repeat
                          ObjectiveMeasures.Init;
                          ObjectiveMeasures.MeasureID:=MeasureFormats.MeasureID;
                          ObjectiveMeasures."Measure Description":=MeasureFormats.Description;
                          ObjectiveMeasures."Appraisal No":="Appraisal No";
                          ObjectiveMeasures.ObjectiveID:="Line No";
                          ObjectiveMeasures.Targets:=MeasureFormats.Targets;
                          ObjectiveMeasures.Initiatives:=MeasureFormats.Initiatives;
                          ObjectiveMeasures."Review Comments":=MeasureFormats."Review Comments/Achievements";
                          ObjectiveMeasures."Weighting(%)":=MeasureFormats."Weighting(%)";
                          ObjectiveMeasures."Performance Ratings":=MeasureFormats."Performance Ratings(%)";
                          ObjectiveMeasures."Weighted Ratings":=MeasureFormats."Weighted Ratings(%)";
                         if not ObjectiveMeasures.Get(MeasureFormats.MeasureID,"Line No","Appraisal No") then
                          ObjectiveMeasures.Insert;
                         until MeasureFormats.Next=0;
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Appraisal Heading Type":="appraisal heading type"::Objectives;
    end;

    var
        AppraisalTypes: Record "Appraisal Types1";
        ObjectiveMeasures: Record "Objective Performance Measures";
        MeasureFormats: Record "Objective Activities Formats";
}

