

page 75252 "Tender Addendum Bidder"
{
    PageType = List;
    SourceTable = "Tender Addendum Bidder";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No."; Rec."Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS No."; Rec."IFS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("Addendum e-Notice Sent"; Rec."Addendum e-Notice Sent")
                {
                    ApplicationArea = Basic;
                }
                field("e-Notice Sent Date/Time"; Rec."e-Notice Sent Date/Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup11)
            {
                action("Suggest Intention-To-Bid Vendors")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        TenderAddendum.Reset;
                        TenderAddendum.SetRange("Addendum Notice No.", Rec."Addendum Notice No.");
                        if TenderAddendum.FindSet then
                            Procurement.suggestIntentionToBidVends(TenderAddendum);
                    end;
                }
                action("Send Addendum e-Notice")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        TenderAddendum.Reset;
                        TenderAddendum.SetRange("Addendum Notice No.", Rec."Addendum Notice No.");
                        if TenderAddendum.FindSet then
                            Procurement.SendAddendumNotice(TenderAddendum);
                    end;
                }
            }
        }
    }

    var
        Procurement: Codeunit "Procurement Processing";
        TenderAddendum: Record "Tender Addendum Notice";
}

#pragma implicitwith restore

