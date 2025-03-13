# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    @candidates.find { |candidate| candidate[:id] == id }
  end
  
  # Candidates with two or more years of experience
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  # Candidates with 100 or more github points
  def github_points?(candidate)
    candidate[:github_points] >= 100
  end

  # Candidates with Ruby or Python knowledge
  def knows_ruby_or_python?(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  # Candidates who applied within 15 days
  def application_date?(candidate)
    candidate[:date_applied] >= 15.days.ago.to_date
  end

  # Candidates that are 18 years or older
  def candidate_age?(candidate)
    candidate[:age] >= 18
  end

  # Qualified candidates based on requirements
  def qualified_candidates(candidates)
    candidates.select do |candidate|
      experienced?(candidate) &&
      github_points?(candidate) &&
      knows_ruby_or_python?(candidate) &&
      application_date?(candidate) &&
      candidate_age?(candidate)
    end
  end

  def ordered_by_qualifications(candidates)
    candidates.sort_by do |candidate|
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end
  end
      
    # More methods will go below