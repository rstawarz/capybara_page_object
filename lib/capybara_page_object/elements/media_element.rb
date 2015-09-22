module CapybaraPageObject
  class MediaElement < Element

    def autoplay?
        true?(attribute(:autoplay))
      end

      def has_controls?
        true?(attribute(:controls))
      end

      def paused?
        true?(attribute(:paused))
      end

      def duration
        duration = attribute(:duration)
        return duration.to_f if duration
      end

      def volume
        volume = attribute(:volume)
        return volume.to_i if volume
      end

      def ended?
        true?(attribute(:ended))
      end

      def seeking?
        true?(attribute(:seeking))
      end

      def loop?
        true?(attribute(:loop))
      end

      def muted?
        true?(attribute(:muted))
      end

      def true?(value)
        value == true || value == 'true'
      end

  end
end
