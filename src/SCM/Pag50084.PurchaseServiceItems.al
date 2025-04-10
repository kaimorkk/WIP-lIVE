
page 50510 "Purchase Service Items"
{
    PageType = List;
    SourceTable = "Document Approval Delegation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field("Service Code"; "Service Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                // field("Service Name"; "Service Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("G/L Account"; "G/L Account")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("G/L Account Name"; "G/L Account Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("No. Series"; "No. Series")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Capex; Capex)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

