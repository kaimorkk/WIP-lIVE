TableExtension 52193450 tableextension52193450 extends "Company Information" 
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Intrastat Contact Type"(Field 101)".


        //Unsupported feature: Deletion (FieldCollection) on ""Intrastat Contact No."(Field 102)".

        field(50000;"Company P.I.N";Code[30])
        {
        }
        field(50001;"N.S.S.F No.";Code[30])
        {
        }
        field(50002;"Company code";Code[10])
        {
        }
        field(50003;"Working Days Per Year";Integer)
        {
        }
        field(50004;"Working Hours Per Week";Integer)
        {
        }
        field(50005;"Working Hours Per Day";Integer)
        {
        }
        field(50006;Mission;Text[150])
        {
        }
        field(50007;"Mission/Vision Link";Text[50])
        {
        }
        field(50008;Vision;Text[150])
        {
        }
        field(50009;"N.H.I.F No";Text[100])
        {
        }
        field(50010;"Co-operate Philosophy";Text[150])
        {
        }
        field(50011;"Pension No.";Code[50])
        {
        }
        field(50012;"CBK Web Address";Text[80])
        {
        }
        field(50014;"HR Support Email";Text[80])
        {
        }
        field(50015;"Procurement Support E-mail";Text[80])
        {
        }
        field(50017;"CS Email";Text[80])
        {
        }
        field(50018;"Communication & PA";Text[80])
        {
        }
        field(50019;"Document Management Link";Text[50])
        {
        }
        field(50022;"Fleet Manager Support Email";Text[80])
        {
        }
        field(50023;"Training Officer Support Email";Text[80])
        {
        }
        field(50024;"Finance Support Email";Text[80])
        {
        }
        field(50025;"Administrator Email";Text[80])
        {
        }
        field(50026;"Staff Statements Path";Text[50])
        {
        }
        field(55000;"Company Slogan";Text[50])
        {
        }
        field(55001;"PIN No.";Code[20])
        {
        }
        field(55002; "Company Head"; Code[20])
        {
            TableRelation = Employee;
        }
        field(80009; "Company Watermark"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;

        }
    }


    
}

