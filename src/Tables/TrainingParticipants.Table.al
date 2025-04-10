Table 52194005 "Training Participants"
{

    fields
    {
        field(1;Participant;Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Training Request";Code[20])
        {
        }
        field(3;"Employee No";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if empl.Get("Employee No") then begin
                    "Employee Name":=empl."First Name"+ ' '+empl."Middle Name"+' '+empl."Last Name";
                     Department:=empl."Global Dimension 2 Code";
                     Directorate:=empl."Global Dimension 1 Code";
                     Designation:=empl."Job Title";
                   end;
            end;
        }
        field(4;"Employee Name";Text[50])
        {
        }
        field(5;Department;Code[20])
        {
        }
        field(6;Designation;Text[100])
        {
        }
        field(7;"Submitted Report";Boolean)
        {
        }
        field(8;"Need Source";Option)
        {
            OptionCaption = ' ,Appraisal,Employee,HOD';
            OptionMembers = " ",Appraisal,Employee,HOD;

            trigger OnValidate()
            begin
                 /*
                  IF "Need Source"<>"Need Source"::Appraisal THEN BEGIN
                  AppraisalTrainingNeeds.RESET;
                  AppraisalTrainingNeeds.SETRANGE(AppraisalTrainingNeeds."Development Need","Training Need Description")
                  IF AppraisalTrainingNeeds.FIND('-') THEN
                   "Employee No":=HODTrainingNeeds."Employee No";
                
                 END ELSE BEGIN
                  HODTrainingNeeds.RESET;
                  HODTrainingNeeds.SETRANGE(HODTrainingNeeds.Description,"Training Need Description");
                  IF HODTrainingNeeds.FIND('-') THEN
                   "Employee No":=HODTrainingNeeds."Employee No";
                 END;
                 */

            end;
        }
        field(9;"Training Need";Code[20])
        {

            trigger OnValidate()
            begin
                // HODTrainingNeeds.RESET;
                // HODTrainingNeeds.SETRANGE(HODTrainingNeeds.Code,"Training Need");
                // IF HODTrainingNeeds.FIND('-') THEN
                //   "Training Need Description":=HODTrainingNeeds.Description;
                /*
                 AppraisalTrainingNeeds.RESET;
                 AppraisalTrainingNeeds.SETRANGE(AppraisalTrainingNeeds."Need No.","Training Need");
                 IF AppraisalTrainingNeeds.FIND('-') THEN
                   "Training Need Description":=AppraisalTrainingNeeds."Development Need";
                 */

            end;
        }
        field(10;"Training Need Description";Text[250])
        {
            TableRelation = if ("Need Source"=const(HOD)) "Training Needs1".Description where ("Employee No"=field("Employee No"))
                            else if ("Need Source"=const(Appraisal)) "Appraisal Development Needs"."Development Need"
                            else if ("Need Source"=const(Employee)) "Employee Training Needs Table".Description where ("Period End Date"=field("Period End Date"),
                                                                                                                       "Employee No"=field("Employee No"));
        }
        field(11;Directorate;Code[20])
        {
        }
        field(12;"Period End Date";Date)
        {
        }
        field(13;Attendance;Option)
        {
            OptionCaption = 'Attended,Not Attended';
            OptionMembers = Attended,"Not Attended";
        }
        field(14;"Per Diem Distribution";Decimal)
        {
        }
        field(15;"Tuition Fee Distribution";Decimal)
        {
        }
        field(16;"Air Ticket Distribution";Decimal)
        {
        }
        field(17;"Imprest Distribution";Decimal)
        {
        }
        field(18;"Travel Docs Fees Dstrbtn";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;Participant,"Training Request","Period End Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        empl: Record Employee;
        HODTrainingNeeds: Record "Training Needs1";
        AppraisalTrainingNeeds: Record "Appraisal Development Needs";
}

