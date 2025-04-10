

page 75360 "Posted Reclass Voucher"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "FA Reclassification Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total ReClass Amount"; Rec."Total ReClass Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control19; "Reclass Lines")
            {
                SubPageLink = "Header No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control15; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    if Confirm('Are you sure you want to post the re-classification') = true then
                        // ProcurementProcessing.SuggestPlannedPPSchedule(Rec);
                        Message('Suggested');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(70085, true, false, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        ProcurementProcessing: Codeunit "Procurement Processing";
}

#pragma implicitwith restore

