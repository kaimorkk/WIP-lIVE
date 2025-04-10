TableExtension 52193670 tableextension52193670 extends "Employee Qualification" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Institution/Company"(Field 8)".

        field(50000;"Qualification Type";Option)
        {
            NotBlank = false;
            OptionMembers = " ",Academic,Professional,Technical;
        }
        field(50001;CourseType;Option)
        {
            OptionMembers = "Short Course","Long Course";
        }
        field(50002;Weight;Integer)
        {
        }
        field(50003;"Score ID";Decimal)
        {
        }
        field(50004;"Grad. Date";Date)
        {
        }
    }
}

