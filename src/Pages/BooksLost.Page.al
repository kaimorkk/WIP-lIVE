Page 52193780 "Books Lost"
{
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Books1;
    SourceTableView = where("Lost?"=const(true));

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
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Author;Author)
                {
                    ApplicationArea = Basic;
                }
                field(ISBN;ISBN)
                {
                    ApplicationArea = Basic;
                    Caption = 'ISBN/ISSN';
                }
                field(ClassificationNo;"Classification No")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(CategoryName;"Category Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(donation;"donation?")
                {
                    ApplicationArea = Basic;
                }
                field(DatedonatedBought;"Date donated/Bought")
                {
                    ApplicationArea = Basic;
                }
                label(Control1000000016)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19001710;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Lost;"Lost?")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000015;"Book audit trail")
            {
                SubPageLink = "Book No"=field(No);
                SubPageView = where("Issued?"=const(true));
            }
        }
    }

    actions
    {
    }

    var
        Text19001710: label 'BORROWING AUDIT TRAIL';
}

