Table 52194006 "Individual Evaluation"
{

    fields
    {
        field(1;Vendor;Text[100])
        {
        }
        field(2;"Evaluator Code";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if EmpRec.Get("Evaluator Code") then
                 "Evaluator Name":=EmpRec."First Name"+' '+EmpRec."Middle Name"+' '+EmpRec."Last Name";
            end;
        }
        field(3;"Evaluator Name";Text[80])
        {
        }
        field(4;"Certificate of Registration";Boolean)
        {
        }
        field(5;"VAT Reg Certificate";Boolean)
        {
        }
        field(6;"PIN Certificate";Boolean)
        {
        }
        field(7;"TAX Compliance Certificate";Boolean)
        {
        }
        field(8;"3 Years Experience";Boolean)
        {
        }
        field(9;"Special Service/ Experience";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;Vendor,"Evaluator Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EmpRec: Record Employee;
}

