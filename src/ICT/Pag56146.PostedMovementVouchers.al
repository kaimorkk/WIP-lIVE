

page 56146 "Posted  Movement Vouchers"
{
    CardPageID = "ICT Movement Voucher card";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Issuance Voucher";
    SourceTableView = where(Type = const(Movement),
                            Posted = const(true),
                            Status = const(Released));
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56242, true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

