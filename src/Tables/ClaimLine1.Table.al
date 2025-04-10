Table 52193859 "Claim Line1"
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
            AutoIncrement = true;
        }
        field(3; "Patient No"; Code[20])
        {
            // TableRelation = "Medical Scheme Lines1"."Line No." where("Employee Code" = field("Employee No"),
            //                                                           "Policy Start Date" = field("Policy Start Date"));

            trigger OnValidate()
            begin
                /*  TESTFIELD("Visit Date");
                   MedSchemeLines.RESET;
                  MedSchemeLines.SETRANGE(MedSchemeLines."Employee Code","Employee No");
                  MedSchemeLines.SETRANGE(MedSchemeLines."Line No.","Patient No");
                  IF MedSchemeLines.FIND('+') THEN
                  "Patient Name":=MedSchemeLines."Other Names"+' '+MedSchemeLines.SurName;
                  Relationship:=MedSchemeLines.Relationship;
                */

            end;
        }
        field(4; "Patient Name"; Text[80])
        {
        }
        field(5; "Hospital/Specialist"; Text[250])
        {
        }
        field(6; "Invoice Number"; Code[20])
        {

            trigger OnValidate()
            begin
                claims.Reset;
                claims.SetRange(claims."Claim No", "Claim No");
                claims.SetRange(claims."Employee No", "Employee No");
                if claims.Find('-') then begin
                    if claims."Invoice Number" = "Invoice Number" then
                        Error('That Invoice number has already been captured!');
                end;
            end;
        }
        field(7; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                "Approved Amount" := Amount;
                // MedicalSheme.Reset;
                // MedicalSheme.SetRange(MedicalSheme."Employee No", "Employee No");
                // if MedicalSheme.Find('+') then begin
                //     MedicalSheme.CalcFields(MedicalSheme."In-Patient Claims", MedicalSheme."Out-Patient Claims");
                //     if Amount + MedicalSheme."In-Patient Claims" > MedicalSheme."Entitlement -Inpatient" then
                //         Message('By Accepting this claim you will be exceed the in-patient limit');

                //     if Amount + MedicalSheme."Out-Patient Claims" > MedicalSheme."Entitlement -OutPatient" then
                //         Message('By Accepting this claim you will be exceed the out-patient limit');


                // end;
            end;
        }
        field(8; "Approved Amount"; Decimal)
        {
        }
        field(9; "Employee No"; Code[20])
        {
            TableRelation = Employee where(Status = filter(Active));

            trigger OnValidate()
            begin
                if emp.Get("Employee No") then
                    "Employee Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(10; "Medical Scheme"; Code[20])
        {
        }
        field(11; Status; Option)
        {
            OptionMembers = " ",Approved,Rejected,"Part Payment";
        }
        field(12; "Amount Spend (In-Patient)"; Decimal)
        {
            CalcFormula = sum("Claim Line1"."Approved Amount" where("Employee No" = field("Employee No"),
                                                                     "Patient No" = field("Patient No"),
                                                                     "Claim Type" = const("In Patient")));
            FieldClass = FlowField;
        }
        field(13; "Amout Spend (Out-Patient)"; Decimal)
        {
            CalcFormula = sum("Claim Line1"."Approved Amount" where("Employee No" = field("Employee No"),
                                                                     "Patient No" = field("Patient No"),
                                                                     "Claim Type" = const("Out Patient")));
            FieldClass = FlowField;
        }
        field(14; "Claim Type"; Option)
        {
            OptionCaption = ' ,In Patient,Out Patient,Dental,Optical';
            OptionMembers = " ","In Patient","Out Patient",Dental,Optical;
        }
        field(15; "Balance (In-Patient)"; Decimal)
        {
        }
        field(16; "Balance (Out-Patient)"; Decimal)
        {
        }
        field(17; "Visit Date"; Date)
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
        field(18; "Employee Name"; Text[80])
        {
        }
        field(19; Relationship; Code[20])
        {
            //TableRelation = "Medical Scheme Header1";
        }
        field(21; "Policy Start Date"; Date)
        {
        }
        field(22; "Commissioner Code"; Code[30])
        {

            trigger OnValidate()
            begin
                dimvalue.Reset;
                if dimvalue.Get('COMMISSIONERS', "Commissioner Code") then
                    "Commissioner Name" := dimvalue.Name;
            end;
        }
        field(23; "Commissioner Name"; Text[50])
        {
        }
        field(24; Settled; Boolean)
        {
        }
        field(25; "Cheque No"; Code[20])
        {
        }
        field(26; Directorate; Code[10])
        {
        }
        field(27; Department; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Claim No", "Line No")
        {
            Clustered = true;
        }
        key(Key2; "Claim Type", "Employee No", "Patient No", "Policy Start Date")
        {
            SumIndexFields = "Approved Amount", Amount;
        }
    }

    fieldgroups
    {
    }

    var
        //MedSchemeLines: Record "Medical Scheme Lines1";
        // MedicalSheme: Record "Medical Scheme Header1";
        AccountingP: Record "Accounting Period";
        emp: Record Employee;
        claims: Record "Claim Line1";
        dimvalue: Record "Dimension Value";
}

