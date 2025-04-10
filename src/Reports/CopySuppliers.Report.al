Report 52193671 "Copy Suppliers"
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
                PreviousSuppliers.Reset;
                PreviousSuppliers.SetRange("Fiscal Year",OldFiscalYear);
                 if PreviousSuppliers.Find('-') then
                  repeat
                   PrequalifiedSuppliers.Init;
                   PrequalifiedSuppliers.TransferFields(PreviousSuppliers);
                   PrequalifiedSuppliers."Fiscal Year":=NewFiscalyear;
                    if not PrequalifiedSuppliers.Get(PrequalifiedSuppliers.Name,PrequalifiedSuppliers.Category,NewFiscalyear) then
                    PrequalifiedSuppliers.Insert;
                  until
                   PreviousSuppliers.Next=0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Specify Fiscal Years")
                {
                    field("Previous Fiscal Year";OldFiscalYear)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "G/L Budget Name";
                    }
                    field("Current Fiscal Year";NewFiscalyear)
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

        if OldFiscalYear='' then
         Error(Text000);
        if NewFiscalyear='' then
         Error(Text001);
        if OldFiscalYear=NewFiscalyear then
         Error(Text002);
    end;

    var
        SupplierCategory: Record "Supplier Category1";
        ProcCategory: Record "Procurement Category Header1";
        Text000: label 'Please specify the Previous fiscal year';
        PrequalifiedSuppliers: Record "Prequalified Suppliers1";
        GLBudgetName: Record "G/L Budget Name";
        PreviousSuppliers: Record "Prequalified Suppliers1";
        OldFiscalYear: Code[20];
        NewFiscalyear: Code[20];
        Text001: label 'Please specify the Current Fiscal Year';
        Text002: label 'The Previous Fiscal Year and the Current fiscal Year cannot be the same';
}

