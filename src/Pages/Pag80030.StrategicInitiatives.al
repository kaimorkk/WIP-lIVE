

page 80030 "Strategic Initiatives"
{
    PageType = ListPart;
    SourceTable = "Strategic Initiative";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pillar ID';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity Code';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity Description';
                }

                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Source Of Fund"; Rec."Source Of Fund")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("CSP Planned Target"; Rec."CSP Planned Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Csp Planned Weight%"; Rec."Csp Planned Weight%")
                {
                    ApplicationArea = Basic;
                }
                field("Collective Budget"; Rec."Collective Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Budget';
                }
                field("Total Posted Planned Target"; Rec."Total Posted Planned Target")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Posted Planned Target';
                    Visible = false;
                }
                field("Total Achieved Target"; Rec."Total Achieved Target")
                {
                    ApplicationArea = Basic;
                }
                field("Csp Achieved Weight%"; Rec."Csp Achieved Weight%")
                {
                    ApplicationArea = Basic;
                }
                field("Total Posted Planned Budget"; Rec."Total Posted Planned Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Posted Planned Budget';
                    Visible = false;
                }
                field("Total Usage Budget"; Rec."Total Usage Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Court Stations"; Rec."Court Stations")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Court Stations field.';
                }
                field(Offices; Rec.Offices)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offices field.';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Implementation Period")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Strategic Int Planning Lines";
                    RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"),
                                  "Theme ID" = field("Theme ID"),
                                  "Objective ID" = field("Objective ID"),
                                  "Strategy ID" = field("Strategy ID"),
                                  Code = field(Code),
                                  "Primary Directorate" = field("Primary Directorate"),
                                  "Primary Department" = field("Primary Department");
                }
            }
            group(Additional)
            {
                action("Additional Indicators")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    RunObject = Page "Additional Performance Ind";
                    RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"),
                                  "Theme ID" = field("Theme ID"),
                                  "Objective ID" = field("Objective ID"),
                                  "Strategy ID" = field("Strategy ID"),
                                  Code = field(Code);
                }
            }
        }
    }
}

#pragma implicitwith restore

