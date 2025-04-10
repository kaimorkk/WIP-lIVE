page 69366 "Consolidate Interview Records"
{
    Caption = 'Consolidate Interview Records';
    CardPageID = "Consolidated Interview Record";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Interview Record";
    SourceTableView = where("Document Type" = filter(Consolidated), Posted = const(false));
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
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Interview Invitation No."; Rec."Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation No. field.';
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field("Candidate Shortlist Vouch No."; Rec."Candidate Shortlist Vouch No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Vouch No. field.';
                }

                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member field.';
                }

                field("Panelist Interview Remarks"; Rec."Panelist Interview Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panelist Interview Remarks field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
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

