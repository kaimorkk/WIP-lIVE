

page 69602 "Terms of Service"
{
    PageType = List;
    SourceTable = "Terms of Service1";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Term Period"; Rec."Contract Term Period")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum No. of Terms"; Rec."Maximum No. of Terms")
                {
                    ApplicationArea = Basic;
                }
                field("Minumum Employment Age (Years)"; Rec."Minumum Employment Age (Years)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Minimum Employment Age (Years)';
                }
                field("Maximum Employment Age (Years)"; Rec."Maximum Employment Age (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Linked to Projects"; Rec."Linked to Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Benefit"; Rec."Pension Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("Service Gratuity Benefit"; Rec."Service Gratuity Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Positions"; Rec."No. of Positions")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Active Employees"; Rec."No. of Active Employees")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

