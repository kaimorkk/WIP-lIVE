Page 75434 "Approved Framework Agreements"
{
    ApplicationArea = Basic;
    CardPageID = "Framework Request Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const("Framework Agreement"),
                            Posted = const(false),
                            Status = const(Released),
                            "Submission Status" = filter(<> Submitted));
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
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("PRN No."; "PRN No.")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder No"; "Awarded Bidder No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Name"; "Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("RFQ Sent"; "RFQ Sent")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Quote No"; "Awarded Quote No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Sum"; "Awarded Bidder Sum")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; "Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID"; "Procurement Category ID")
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
            systempart(Control10; Links)
            {
                ApplicationArea = All;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

