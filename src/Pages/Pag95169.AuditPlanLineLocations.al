

page 95169 "Audit Plan Line Locations"
{
    CardPageID = "Audit Plan Line Location";
    PageType = List;
    SourceTable = "Audit Plan Line Location";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Engagement Line No."; Rec."Engagement Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Line No. field.';
                }
                field("Audit Location ID"; Rec."Audit Location ID")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Audit Location1";
                    ToolTip = 'Specifies the value of the Audit Location ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Responsibility Center";
                    ToolTip = 'Specifies the value of the Responsibility Center ID field.';
                }
                field("Audit Site Type"; Rec."Audit Site Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Site Type field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    TableRelation = Resource;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Email field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

