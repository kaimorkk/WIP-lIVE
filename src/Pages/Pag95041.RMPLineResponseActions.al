

page 95041 "RMP Line Response Actions"
{
    CardPageID = "RMP Line Response Action";
    PageType = List;
    SourceTable = "RMP Line Response Action";

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
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Desription';
                    Editable = false;
                }
                field("Action ID"; Rec."Action ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    Caption = ' Mitigation Strategy';
                    Editable = true;
                }
                field("Risk Response Action Taken"; Rec."Risk Response Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Status';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Timeline; Rec.Timeline)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

