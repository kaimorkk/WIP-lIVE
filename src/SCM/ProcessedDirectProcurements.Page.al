Page 75401 "Processed Direct Procurements"
{
    ApplicationArea = Basic;
    CardPageID = "Direct Procurement Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const("Direct Procurement"),
                            Posted = const(true),
                            Status = const(Released));
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

    trigger OnAfterGetRecord()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement Manager" = false or UserSetup."Procurement officer" = false then
                Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement Manager" = false or UserSetup."Procurement officer" = false then
                Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

