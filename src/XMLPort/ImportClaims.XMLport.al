XmlPort 50014 "Import Claims"
{
    Caption = 'Import IRIS to Resol. Codes';
    Direction = Import;
    FieldDelimiter = '<">';
    FieldSeparator = '<,>';
    Format = VariableText;
    FormatEvaluate = Legacy;
    TableSeparator = '<NewLine>';
    TextEncoding = WINDOWS;

    schema
    {
        textelement(ClaimLine)
        {
            tableelement("Claim Line1"; "Claim Line1")
            {
                XmlName = 'ClaimLine';
                fieldelement(ClaimNo; "Claim Line1"."Claim No")
                {
                }
                fieldelement(EmployeeNo; "Claim Line1"."Employee No")
                {
                }
                fieldelement(Directorate; "Claim Line1".Directorate)
                {
                }
                fieldelement(Department; "Claim Line1".Department)
                {
                }
                fieldelement(EmployeeName; "Claim Line1"."Employee Name")
                {
                }
                fieldelement(PatientName; "Claim Line1"."Patient Name")
                {
                }
                fieldelement(ClaimType; "Claim Line1"."Claim Type")
                {
                }
                fieldelement(Hospital; "Claim Line1"."Hospital/Specialist")
                {
                }
                fieldelement(InvoiceDate; "Claim Line1"."Visit Date")
                {
                }
                fieldelement(Amount; "Claim Line1".Amount)
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

    trigger OnPreXmlPort()
    begin
        "Claim Line1"."Line No" := "Claim Line1"."Line No" + 10000;
    end;
}

