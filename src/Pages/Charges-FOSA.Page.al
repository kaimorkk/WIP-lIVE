Page 52193544 "Charges - FOSA"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = Card;
    SourceTable = "Charges - FOSA";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ChargeAmount;"Charge Amount")
                {
                    ApplicationArea = Basic;
                }
                field(UsePercentage;"Use Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(PercentageofAmount;"Percentage of Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Minimum;Minimum)
                {
                    ApplicationArea = Basic;
                }
                field(Maximum;Maximum)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"GL Account")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000002;Notes)
            {
            }
            systempart(Control1000000001;MyNotes)
            {
            }
            systempart(Control1000000000;Links)
            {
            }
        }
    }

    actions
    {
    }
}

