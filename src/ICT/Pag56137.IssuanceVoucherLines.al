

page 56137 "Issuance Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "ICT Issuance Voucher Lines";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use start date field.';
                }
                field("Duration of Use end date"; Rec."Duration of Use end date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use end date field.';
                }
                field("Duration of Use"; Rec."Duration of Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use field.';
                }
                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No field.';
                }
                field("Reason For Movement"; Rec."Reason For Movement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Movement field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Return Reason"; Rec."Return Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Reason field.';
                }
                field("Return Condition"; Rec."Return Condition")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Return Condition field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

