

page 52193689 "Salary Scale List"
{
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Pointer"; Rec."Minimum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Pointer"; Rec."Maximum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Allowance"; Rec."Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Commuter Allowance"; Rec."Commuter Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("In Patient Limit"; Rec."In Patient Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Out Patient Limit"; Rec."Out Patient Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Cover"; Rec."Maximum Cover")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Car Loan"; Rec."Maximum Car Loan")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Mortage Loan"; Rec."Maximum Mortage Loan")
                {
                    ApplicationArea = Basic;
                }

            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; Links)
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

