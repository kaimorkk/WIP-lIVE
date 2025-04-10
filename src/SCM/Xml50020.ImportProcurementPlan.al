
xmlport 50020 "Import Procurement Plan"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Procurement Plan1"; "Procurement Plan1")
            {
                XmlName = 'ProcurementPlan';
                fieldelement(PlanYear; "Procurement Plan1"."Plan Year")
                {
                }
                fieldelement(PlanItemNo; "Procurement Plan1"."Plan Item No")
                {
                }
                fieldelement(des; "Procurement Plan1"."Item Description")
                {
                }
                fieldelement(dir; "Procurement Plan1"."Directorate Code")
                {
                }
                fieldelement(Dept; "Procurement Plan1"."Department Code")
                {
                }
                fieldelement(ProcurementType; "Procurement Plan1"."Procurement Type")
                {
                }
                fieldelement(Quantity; "Procurement Plan1".Quantity)
                {
                }
                fieldelement(UnitPrice; "Procurement Plan1"."Unit Cost")
                {
                }
                fieldelement(FundingSource; "Procurement Plan1"."Funding Source Code")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

