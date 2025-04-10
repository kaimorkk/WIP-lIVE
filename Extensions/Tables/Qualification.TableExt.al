TableExtension 52193669 tableextension52193669 extends Qualification 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 2)".

        field(50000;Type;Option)
        {
            OptionMembers = Qualification,"Job Grade";
        }
        field(50001;"Qualification Type";Option)
        {
            OptionCaption = ' ,Academic,Professional,Technical,Experience,Personal Attributes';
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(69600; "Qualification Category"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Professional Body';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Professional Body";
        }
        field(69601; "Academic Hierachy Code"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69602; "No. of Active Employees"; Integer)
        {
            CalcFormula = count("Employee Qualification" where("Qualification Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(69603; "No. of Qualified Applicants"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69604; Blocked; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }
}

