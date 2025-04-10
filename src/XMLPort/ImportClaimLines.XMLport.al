XmlPort 50002 "Import Claim Lines"
{
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Medical_Claim_lines)
        {
            tableelement("Claim Line1"; "Claim Line1")
            {
                XmlName = 'Claim_line_1';
                fieldelement(Claim_no; "Claim Line1"."Claim No")
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
}

