Page 52193771 "Files Due At Registry"
{
    Editable = false;
    PageType = Card;
    SourceTable = "File Movement Details1";
    SourceTableView = where("Returned?"=const(false));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(FileMovementCode;"File Movement Code")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(FileCode;"File Code")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(FileIssuedate;"File Issue date")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(DateDueatRegistry;"Date Due at Registry")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Officerissuedfile;"Officer issued file")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(OfficerName;"Officer Name")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
            }
        }
    }

    actions
    {
    }
}

