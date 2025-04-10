Table 52193875 "Claim Line-Comm1"
{
    DrillDownPageID = "Claim Lines List";
    LookupPageID = "Claim Lines List";

    fields
    {
        field(1; "Claim No"; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Hospital/Specialist"; Text[50])
        {
        }
        field(4; "Invoice Number"; Code[20])
        {

            trigger OnValidate()
            begin
                claims.Reset;
                claims.SetRange(claims."Claim No", "Claim No");
                claims.SetRange(claims."Policy Start Date", "Policy Start Date");
                if claims.Find('-') then begin
                    if claims."Invoice Number" = "Invoice Number" then
                        Error('That Invoice number has already been captured!');
                end;
            end;
        }
        field(5; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                Status := Status;

                // MedicalSheme.Reset;
                // MedicalSheme.SetRange(MedicalSheme."Commissioner Code", "Commissioner Code");
                // if MedicalSheme.Find('+') then begin
                //     MedicalSheme.CalcFields(MedicalSheme."In-Patient Claims", MedicalSheme."Out-Patient Claims");
                //     if Amount + MedicalSheme."In-Patient Claims" > MedicalSheme."Entitlement -Inpatient" then
                //         Message('By Accepting this claim you will be exceeding the in-patient limit');

                //     if Amount + MedicalSheme."Out-Patient Claims" > MedicalSheme."Entitlement -OutPatient" then
                //         Message('By Accepting this claim you will be exceeding the out-patient limit');


                // end;
            end;
        }
        field(6; "Approved Amount"; Decimal)
        {
        }
        field(7; "Medical Scheme"; Code[20])
        {
        }
        field(8; Status; Option)
        {
            OptionMembers = " ",Approved,Rejected,"Part Payment";
        }
        field(9; "Amount Spend (In-Patient)"; Decimal)
        {
            CalcFormula = sum("Claim Line-Comm1".Amount where("Commissioner Code" = field("Commissioner Code"),
                                                               "Policy Start Date" = field("Policy Start Date"),
                                                               "Claim Type" = const("In-Patient")));
            FieldClass = FlowField;
        }
        field(10; "Amout Spend (Out-Patient)"; Decimal)
        {
            CalcFormula = sum("Claim Line-Comm1".Amount where("Commissioner Code" = field("Commissioner Code"),
                                                               "Policy Start Date" = field("Policy Start Date"),
                                                               "Claim Type" = const("In-Patient")));
            FieldClass = FlowField;
        }
        field(11; "Claim Type"; Option)
        {
            OptionMembers = " ","In-Patient","Out-Patient";
        }
        field(12; "Balance (In-Patient)"; Decimal)
        {
        }
        field(13; "Balance (Out-Patient)"; Decimal)
        {
        }
        field(14; "Visit Date"; Date)
        {

            trigger OnValidate()
            begin
                AccountingP.Reset;
                AccountingP.SetRange(AccountingP."Starting Date", 0D, "Visit Date");
                AccountingP.SetRange(AccountingP."New Fiscal Year", true);
                if AccountingP.Find('+') then
                    "Policy Start Date" := AccountingP."Starting Date";
            end;
        }
        field(15; Relationship; Code[20])
        {
            //TableRelation = "Medical Scheme Header1";
        }
        field(16; "Policy Start Date"; Date)
        {
        }
        field(17; "Commissioner Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COMMISSIONERS'));

            trigger OnValidate()
            begin
                dimvalue.Reset;
                if dimvalue.Get('COMMISSIONERS', "Commissioner Code") then
                    "Commissioner Name" := dimvalue.Name;

                Relationship := 'COMMISSIONER';
            end;
        }
        field(18; "Commissioner Name"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Claim No", "Line No")
        {
            Clustered = true;
        }
        key(Key2; "Claim Type", "Commissioner Code", "Policy Start Date")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        //MedSchemeLines: Record "Medical Scheme Lines1";
        // MedicalSheme: Record "Medical Scheme Header - Comm1";
        AccountingP: Record "Accounting Period";
        emp: Record Employee;
        claims: Record "Claim Line1";
        dimvalue: Record "Dimension Value";
}

