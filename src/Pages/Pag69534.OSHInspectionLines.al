

page 69534 "OSH Inspection Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field("Response Code"; Rec."Response Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Code field.';
                }
                field("Response Description"; Rec."Response Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Response Description field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

