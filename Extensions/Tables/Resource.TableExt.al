 
   #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 52193479 "tableextension50034" extends Resource
{
    fields
    {
        modify(Type)
        {
            OptionCaption = 'Person,Machine,Panelist';

            //Unsupported feature: Property Modification (OptionString) on "Type(Field 2)".

        }

        //Unsupported feature: Property Modification (Data type) on ""Job Title"(Field 10)".


        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          ResSetup.GET;
          NoSeriesMgt.TestManual(ResSetup."Resource Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ("Resource Type"="Resource Type"::" ") THEN BEGIN
        #1..5
        END;

        IF ("Resource Type"="Resource Type"::Normal) THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
           GrantSetup.GET;
          NoSeriesMgt.TestManual(GrantSetup."Researcher Nos");
          "No. Series" := '';
        END;
        END;

        IF ("Resource Type"="Resource Type"::Researcher) THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
           GrantSetup.GET;
          NoSeriesMgt.TestManual(GrantSetup."Grant Admin Nos");
          "No. Series" := '';
        END;
        END;
        */
        //end;
        field(561; "Service No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(62; Email; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(63; "ID/Passport No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "Researcher?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Bank Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50025; "Branch Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50026; "Bank Branch No."; Text[20])
        {
            DataClassification = CustomerContent;
            NotBlank = false;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange("Bank Branch No.", "Bank Branch No.");
                if EmployeeBankAccountX.FindSet then begin
                    "Branch Name" := EmployeeBankAccountX."Branch Name";
                end;
            end;
        }
        field(50027; "Bank Account No."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50028; "Bank Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(Code, "Bank Code");
                if EmployeeBankAccountX.FindSet then begin
                    "Bank Name" := EmployeeBankAccountX."Bank Name";
                end;
            end;
        }
        field(50029; "M-Pesa Number"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(65002; "No. of Awarded GFO"; Integer)
        {
            // CalcFormula = count("Grant Funding Application" where("Principal Investigator" = field("No."),
            //                                                        "Application Status" = const(Won),
            //                                                        "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65003; "No. of Lost Grant GFO"; Integer)
        {
            // CalcFormula = count("Grant Funding Application" where("Principal Investigator" = field("No."),
            //                                                        "Application Status" = const(Lost),
            //                                                        "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65004; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Person Responsible" = field("No."),
                                           Status = filter(Open | Planning | Quote),
                                           "Document Type" = const(Project),
                                           "Starting Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65005; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Person Responsible" = field("No."),
                                           Status = filter(Completed),
                                           "Document Type" = const(Project),
                                           "Ending Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65006; "No. of Research Outputs"; Integer)
        {
            // CalcFormula = count("Research Output Register" where("Principle Investigator" = field("No."),
                                                                  // "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65007; "Total Amount Awarded(LCY)"; Decimal)
        {
            // CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Principal Investigator" = field("No.")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65008; Admin; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(65009; "Employee No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee;
        }
        field(65010; "Employee Name"; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(65011; "Resource Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Normal,Researcher,Administrator,Project Engineer';
            OptionMembers = " ",Normal,Researcher,Administrator,"Project Engineer";
        }
        field(65012; "External Consultant"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(65013; "Researcher's Major"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(65014; "Researcher Biography"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(65015; "Job Group"; Code[20])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("Resource No." = field("No.")));
            FieldClass = FlowField;
        }
        field(65016; "Employee status"; Option)
        {
            CalcFormula = lookup(Employee.Status where("Resource No." = field("No.")));
            FieldClass = FlowField;
            OptionMembers = Active,Inactive,Terminated;
        }
        field(65017; "E-mail Address"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(72000; "Project Engineer"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'RMS Field';
        }
        field(72001; "No. Of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Project Manager" = field("No."),
                                           Status = filter(Open)));
            Description = 'RMS Field';
            FieldClass = FlowField;
        }
        field(72002; "No. Of Finished Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Project Manager" = field("No."),
                                           Status = filter(Planning)));
            Description = 'RMS Field';
            FieldClass = FlowField;
        }
        field(72003; "No. Of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Project Manager" = field("No."),
                                           Status = filter(Completed)));
            Description = 'RMS Field';
            FieldClass = FlowField;
        }
        field(72004; Interns; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85000; "Transaction Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Work Type".Code;
        }
        field(85001; "Exam Booking Category"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Paper,Section;
        }
        field(85002; "Section ID"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = Section.Code where(Part = field("Part ID"));
        }
        field(85003; "Course ID"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = Courses;
        }
        field(85004; "Paper ID"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = Papers where(Course = field("Course ID"),
            //                               Section = field("Section ID"),
            //                               Level = field("Part ID"));
        }
        field(85005; "Part ID"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = Level;
        }
        field(85006; "Exam Resorce Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(85007; "E-Mail"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(85008; "Exam Task Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Checker,Marker,Invigilator,Moderator,Setter,Reviewer,Chief Examiner';
            OptionMembers = " ",Checker,Marker,Invigilator,Moderator,Setter,Reviewer,"Chief Examiner";
        }
        field(85400; "Examiner Code"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Examiner Setup";
        }
        field(85401; Signature; Blob)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
            SubType = Bitmap;
        }
        field(85402; "Payee Bank Acc Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      ResSetup.GET;
      ResSetup.TESTFIELD("Resource Nos.");
      NoSeriesMgt.InitSeries(ResSetup."Resource Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF GETFILTER("Resource Group No.") <> '' THEN
      IF GETRANGEMIN("Resource Group No.") = GETRANGEMAX("Resource Group No.") THEN
        VALIDATE("Resource Group No.",GETRANGEMIN("Resource Group No."));

    DimMgt.UpdateDefaultDim(
      DATABASE::Resource,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    IF ("Resource Type"="Resource Type"::" ") THEN BEGIN
    #1..5
    END;

    IF ("Resource Type"="Resource Type"::Normal) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantSetup.GET;
      GrantSetup.TESTFIELD("Researcher Nos");
      NoSeriesMgt.InitSeries(GrantSetup."Researcher Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;

    IF ("Resource Type"="Resource Type"::Researcher) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantSetup.GET;
      GrantSetup.TESTFIELD("Grant Admin Nos");
      NoSeriesMgt.InitSeries(GrantSetup."Grant Admin Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;
    #6..13
    */
    //end;

    var
        // GrantSetup: Record "Grants Setup";
        EmployeeBankAccountX: Record "Employee Bank AccountX";
}

