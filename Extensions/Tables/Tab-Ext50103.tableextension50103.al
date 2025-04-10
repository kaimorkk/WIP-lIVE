
tableextension 50103 "tableextension50103" extends "Employee Qualification"
{
    fields
    {

        //Unsupported feature: Property Insertion (AutoIncrement) on ""Line No."(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Qualification Code"(Field 3)".

        field(69603; Year; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(69604; Specialization; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(69600; "Specialized Domain Area"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Domain Area";
        }
        field(69601; "Qualification Category"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }

        field(69602; Grades; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Academic Grades";
        }

    }
    keys
    {

        //Unsupported feature: Deletion (KeyCollection) on ""Qualification Code"(Key)".

    }
}

