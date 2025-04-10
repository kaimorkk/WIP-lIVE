

page 69704 "Candidate Shortlist Vouchers"
{
    Caption = 'Candidate Shortlist Vouchers';
    CardPageID = "Candidate Shortlist Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type" = filter("Candidate Shortlisting"), "Document Status" = filter(Active));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
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

