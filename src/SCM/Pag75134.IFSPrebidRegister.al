

page 75134 "IFS Prebid Register"
{
    CardPageID = "IFS Prebid Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "IFS Prebid Register";
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
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Description field.';
                }
                field("Pre-bid Visit Date"; Rec."Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit Date field.';
                }
                field("Pre-bid Visit Start Time"; Rec."Pre-bid Visit Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit Start Time field.';
                }
                field("Pre-bid Visit End Date"; Rec."Pre-bid Visit End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit End Date field.';
                }
                field("Pre-bid Visit End Time"; Rec."Pre-bid Visit End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit End Time field.';
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Purchaser Code field.';
                }
                field("No. of Bidders"; Rec."No. of Bidders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Bidders field.';
                }
                field("No. of Prebid Attendees"; Rec."No. of Prebid Attendees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Prebid Attendees field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

