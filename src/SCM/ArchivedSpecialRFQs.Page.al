Page 75440 "Archived Special RFQs"
{
    ApplicationArea = Basic;
    Caption = 'Archived Special Request For Quotations (RFQ)';
    CardPageID = "Special Request For Quotation";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const(RFQ),
                            Archive = const(true),
                            "Invitation Notice Type" = const("Special RFQ"));
    UsageCategory = History;

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
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; "Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
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
                field(Published; Published)
                {
                    ApplicationArea = Basic;
                }
                field(Archive; Archive)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
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

