

page 75115 "Procurement Standing Comm Card"
{
    PageType = Card;
    SourceTable = "Procurement Standing Committee";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure Start Date"; Rec."Tenure Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure End Date"; Rec."Tenure End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "Proc Standing Committee Member")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
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

