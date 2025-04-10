

page 69623 "Recruitment Plan Position"
{
    PageType = ListPart;
    SourceTable = "Recruitment Plan Position";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Planned New Hires"; Rec."Total Planned New Hires")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Budget Cost (LCY)"; Rec."Recruitment Budget Cost (LCY)")
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
            group("Planning Lines")
            {
                Image = ExecuteBatch;
                action("Position Planning Lines")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Recruitment Planning Line";
                    RunPageLink = "Recruitment Plan ID" = field("Recruitment Plan ID"),
                                  "Position ID" = field("Position ID");
                }
            }
            group(Functions)
            {
                action("Create Vacancy")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;

                    trigger OnAction()
                    begin
                        if Confirm('are you sure you want to create a vacancy for the position %1', true, Rec."Job Title/Designation") = true then begin
                            if Rec."Total Planned New Hires" > 0 then begin
                                Recruitment.TransferPlanToVacancy(Rec);
                            end;

                        end
                    end;
                }
            }
            group("Related Information")
            {
                action("Position Requirements")
                {
                    ApplicationArea = Basic;
                    Image = AgreementQuote;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Positions Requirements";
                    RunPageLink = "Position ID" = field("Position ID");
                    RunPageMode = View;
                }
                action("Position Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReminderTerms;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Position Responsibilities";
                    RunPageLink = "Position ID" = field("Position ID");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                }
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

