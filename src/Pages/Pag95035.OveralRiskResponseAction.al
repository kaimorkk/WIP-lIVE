

page 95035 "Overal Risk Response Action"
{
    PageType = Card;
    SourceTable = "Overal Risk Response Action";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Rating Scale Type field.';
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Scale ID field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Response Action ID"; Rec."Response Action ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Action ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

