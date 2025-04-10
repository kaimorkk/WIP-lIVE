Page 52194020 "Objectives TC Financial"
{
    PageType = ListPart;
    SourceTable = "Appraisal Objectives Lines1";
    SourceTableView = where("Appraisal Heading Type"=const("Technical Competencies"),
                            "Strategic Perspective"=const(Financial));

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
                }
                field(Measure;Measure)
                {
                    ApplicationArea = Basic;
                }
                field(TimeFrame;"Agreed Target Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time Frame ';
                }
                field(Weighting;"Weighting(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Weighting';
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
                    RunObject = Page "Objectives Measures";
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

    var
        MeasureFormats: Record "Objective Activities Formats";
        ObjectiveMeasures: Record "Objective Performance Measures";
}

