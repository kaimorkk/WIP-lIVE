

page 95284 "Audit Exec  Meeting Agenda Lin"
{
    PageType = ListPart;
    SourceTable = "Audit Execution Meeting Agenda";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
                field("Estimate Time (Minutes)"; Rec."Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Time (Minutes) field.';
                }
                field("No. of Discussed Items"; Rec."No. of Discussed Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Discussed Items field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Disscused Items")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disscused Items';
                    Image = DateRange;
                    RunObject = Page "Audit Execution Meeting Summar";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Agenda Code" = field("Agenda Code");
                    ToolTip = 'Executes the Disscused Items action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

