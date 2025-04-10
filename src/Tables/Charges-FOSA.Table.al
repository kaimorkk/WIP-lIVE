Table 52193488 "Charges - FOSA"
{
    DrillDownPageID = "Charges - FOSA";
    LookupPageID = "Charges - FOSA";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[150])
        {
        }
        field(3;"Charge Amount";Decimal)
        {
        }
        field(5;"Percentage of Amount";Decimal)
        {

            trigger OnValidate()
            begin
                if "Percentage of Amount">100 then
                Error('You cannot exceed 100. Please enter a valid number.');
            end;
        }
        field(6;"Use Percentage";Boolean)
        {
        }
        field(7;"GL Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(8;Minimum;Decimal)
        {

            trigger OnValidate()
            begin
                if Maximum<>0 then begin
                if Maximum<Minimum then
                Error('The maximum amount cannot be less than the minimum amount.');
                end;
            end;
        }
        field(9;Maximum;Decimal)
        {

            trigger OnValidate()
            begin
                if Minimum<>0 then begin
                if Minimum>Maximum then
                Error('The minimum amount cannot be more than the maximum amount.');
                end;
            end;
        }
        field(10;"Charge Type";Option)
        {
            OptionCaption = ' ,Loans,Special Advance,Discounting,Standing Order Fee,Failed Standing Order Fee,External Standing Order Fee';
            OptionMembers = " ",Loans,"Special Advance",Discounting,"Standing Order Fee","Failed Standing Order Fee","External Standing Order Fee";
        }
        field(11;"Charges 1-199";Decimal)
        {
        }
        field(12;"Charges 200-999";Decimal)
        {
        }
        field(13;"Charges 1000-1999";Decimal)
        {
        }
        field(14;"Charges 2000-2500";Decimal)
        {
        }
        field(15;"Charges 2501";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        /*TransactionCharges.RESET;
        TransactionCharges.SETFILTER(TransactionCharges."Line No","No.");
        IF TransactionCharges.FIND('-') THEN BEGIN
        TransactionCharges."Line No":="No.";
        TransactionCharges.Description:="Line No.";
        TransactionCharges."Charge Amount":="Charge Name";
        TransactionCharges."Percentage of Amount":="Charge Amount";
        TransactionCharges."Use Percentage":="Use Percentage";
        TransactionCharges."G/L Account":="Percentage of Amount";
        TransactionCharges."Minimum Amount":="GL Account";
        TransactionCharges."Maximum Amount":=Statutory;
        TransactionCharges.MODIFY;
        END;*/

    end;

    var
        TransactionCharges: Record "Transaction Charges";
}

