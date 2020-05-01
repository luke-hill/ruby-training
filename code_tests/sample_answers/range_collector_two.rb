# frozen_string_literal: true

# 257 bytes - Code golf
class RangeCollector
  def play(a)
    a.each_with_index { |v, i|
      next if i==0
      l = a[i-1]
      if l.is_a?(String)
        next if l[-1].to_i+1!=v
        a[i]="#{l[0]}-#{v}"
        a[i-1]=nil
      elsif l+1==v
        a[i]="#{l}-#{v}"
        a[i-1]=nil
      end
    }.compact
  end
end
