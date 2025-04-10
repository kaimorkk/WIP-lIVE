Report 52193670 "Prequalification Category"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Procurement Category Header1";"Procurement Category Header1")
        {
            DataItemTableView = sorting("Fiscal Year",Category);
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin

                SupplierCategory.Reset;
                 if SupplierCategory.Find('-') then
                  repeat
                   ProcCategory.Init;
                   ProcCategory."Fiscal Year":=FiscalYear;
                   ProcCategory.Category:=SupplierCategory."Category Code";
                   ProcCategory.Validate(Category);
                    if not ProcCategory.Get(ProcCategory."Fiscal Year",ProcCategory.Category) then
                    ProcCategory.Insert;
                  until
                   SupplierCategory.Next=0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Specify Fiscal Year")
                {
                    field("Fiscal Year";FiscalYear)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "G/L Budget Name";
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if FiscalYear='' then
        Error(Text000);
    end;

    var
        SupplierCategory: Record "Supplier Category1";
        ProcCategory: Record "Procurement Category Header1";
        Text000: label 'Please specify the fiscal year';
        FiscalYear: Code[20];
}

