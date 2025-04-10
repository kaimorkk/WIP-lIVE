Page 75438 "Approved Special Quotations"
{
    ApplicationArea = Basic;
    Caption = 'Approved Request For Quotations (RFQ)';
    CardPageID = "Special Request For Quotation";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const(RFQ),
                            Status = const(Released),
                            "Invitation Notice Type" = const("Special RFQ"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("PRN No."; "PRN No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; "Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("RFQ Sent"; "RFQ Sent")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQs No';
                }
                field("RFQ Sent On"; "RFQ Sent On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control8; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control10; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

