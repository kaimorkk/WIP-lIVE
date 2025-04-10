

page 70102 "Asset Disposals List"
{
    CardPageID = "Asset Disposal Card";
    PageType = List;
    SourceTable = "Asset Disposal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal No"; Rec."Disposal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Asset Code"; Rec."Asset Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Code field.';
                }
                field("Language Code (Default)"; Rec."Language Code (Default)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code (Default) field.';
                }
                field(Attachement; Rec.Attachement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachement field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Committee Code"; Rec."Committee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Asset Name"; Rec."Asset Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Name field.';
                }
                field("Valuation Amount"; Rec."Valuation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valuation Amount field.';
                }
                field("Committee Recommendations"; Rec."Committee Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Recommendations field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

