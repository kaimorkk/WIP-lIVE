

page 69445 "OSH Legal Instrument"
{
    PageType = Card;
    SourceTable = "OSH Legal Instrument";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Instrument Type"; Rec."Instrument Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Instrument Type field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control8; "OSH legal Instruments Lines")
            {
                Caption = 'Executive Summary';
                SubPageLink = "Legal Instrument ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

