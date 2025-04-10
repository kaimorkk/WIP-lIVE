Page 52193838 "External Communications"
{
    PageType = Card;
    SourceTable = "external comm. categories1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(CategoryName;"Category Name")
                {
                    ApplicationArea = Basic;
                }
                field(CategoryID;"Category ID")
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000008)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19036660;
                Style = Strong;
                StyleExpr = true;
            }
            part(Control1000000009;communicationlines)
            {
                SubPageLink = "Stake holder Category"=field(No);
                Visible = true;
            }
        }
    }

    actions
    {
    }

    var
        Text19036660: label 'Communications lines';
}

