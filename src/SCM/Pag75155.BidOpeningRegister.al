

page 75155 "Bid Opening Register"
{
    CardPageID = "Bid Opening Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Opening Register";
    SourceTableView = where(Type = const(Technical));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Start Time field.';
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening End Date field.';
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening End Time field.';
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Purchaser Code field.';
                }
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Intention To Bid Vendor field.';
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submitted Bids field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Bid Opening Com field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Bid Unsealing Type"; Rec."Bid Unsealing Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Unsealing Type field.';
                }
                field("Final Opening Done"; Rec."Final Opening Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Opening Done field.';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Deadline field.';
                }
                field("Bid Register No."; Rec."Bid Register No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Register No. field.';
                }
                field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Bid Security Amount (LCY) field.';
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Venue field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

