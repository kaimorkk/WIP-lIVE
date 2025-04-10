

page 52193712 "Salary Scales"
{
    PageType = Card;
    SourceTable = "Salary Scales";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Authority"; Rec."Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Valid Positions"; Rec."Valid Positions")
                {
                    ApplicationArea = Basic;
                }
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Mobility Transfer Rate"; Rec."Mobility Transfer Rate")
                {
                    Caption = 'Baggage Allowance Rate per KM';
                    ApplicationArea = Basic;
                }
                field("Leave Allowance"; Rec."Leave Allowance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Allowance field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control16; "Job Grade Pointers")
            {
                SubPageLink = "Salary Scale" = field(Scale);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Default Benefits Plan")
            {
                ApplicationArea = Basic;
                Image = Default;
                //RunObject = Page "Benefit Plan Line";
                //RunPageLink = "Plan ID" = field(Scale);
                trigger OnAction()
                var
                    Pointers: Record "Salary Pointers";
                    ScaleBenefits: Record "Scale Benefits";
                    TransCodes: Record "PR Transaction Codes";
                begin

                    TransCodes.Reset();
                    TransCodes.SetRange("Applies to All", true);
                    if TransCodes.FindSet() then
                        repeat
                            Pointers.Reset();
                            Pointers.SetRange("Salary Scale", Rec.Scale);
                            if Pointers.FindSet() then
                                repeat
                                    ScaleBenefits.Reset();
                                    ScaleBenefits.SetRange("Salary Scale", Pointers."Salary Scale");
                                    ScaleBenefits.SetRange("Salary Pointer", Pointers."Salary Pointer");
                                    ScaleBenefits.SetRange("ED Code", TransCodes."Transaction Code");
                                    if ScaleBenefits.IsEmpty then begin
                                        ScaleBenefits.Init();
                                        ScaleBenefits."Salary Scale" := Pointers."Salary Scale";
                                        ScaleBenefits."Salary Pointer" := Pointers."Salary Pointer";
                                        ScaleBenefits.Validate("ED Code", TransCodes."Transaction Code");
                                        if TransCodes."Calculation Method" = TransCodes."Calculation Method"::"Gross Pay" then
                                            ScaleBenefits.Validate("Based On", ScaleBenefits."Based On"::Percentage)
                                        else
                                            ScaleBenefits.Validate("Based On", ScaleBenefits."Based On"::Amount);
                                        ScaleBenefits.Insert();
                                    end;

                                until Pointers.Next() = 0;
                        until TransCodes.Next() = 0;


                end;

            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.SetRange(Scale, Rec.Scale);
                    Report.Run(69615, true, false, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Default Benefits Plan_Promoted"; "Default Benefits Plan")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

