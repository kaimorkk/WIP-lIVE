

page 56135 "ICT Issuance Vouchers"
{
    CardPageID = "ICT Issuance Voucher card";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Issuance Voucher";
    SourceTableView = where(Type = const(Issuance),
                            Posted = const(false),
                            Status = filter(<> Released),
                            "Document Status" = filter(Open | Submitted));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To User ID field.';
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To No. field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                ToolTip = 'Executes the Print action.';
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

